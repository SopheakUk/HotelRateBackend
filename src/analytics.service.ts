// analytics.service.ts
import { Injectable, OnModuleInit, OnModuleDestroy } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Booking } from './entities/booking.entity';
import { RoomType } from './entities/room-type.entity';
import dayjs from 'dayjs';
import { AnalyticsGateway } from './analytics.gateway';

@Injectable()
export class AnalyticsService implements OnModuleInit, OnModuleDestroy {
  constructor(
    @InjectRepository(Booking)
    private readonly bookingRepo: Repository<Booking>,
    @InjectRepository(RoomType)
    private readonly roomTypeRepo: Repository<RoomType>,
    private readonly gateway: AnalyticsGateway
  ) {}

  private intervalId: NodeJS.Timeout;

  onModuleInit() {
    this.intervalId = setInterval(() => {
      this.runPeriodicTask();
    }, 2000); // every 2 seconds
  }

  onModuleDestroy() {
    clearInterval(this.intervalId); // cleanup on shutdown
  }

  private runPeriodicTask() {
    console.log('Running task at', new Date().toISOString());
    this.ws();
    // Add your logic here
  }


   async ws() {

    const data = Math.floor(Math.random() * (500 - 0 + 1)) + 0;

    this.gateway.publishUpdate( {
      type: 'forecast',
      data: data,
    });

  }


  async getDailyRevenue(hotelId: number, date: string): Promise<number> {
    const result = await this.bookingRepo
      .createQueryBuilder('b')
      .select('SUM(b.rate)', 'revenue')
      .where('b.hotelId = :hotelId', { hotelId })
      .andWhere(':date BETWEEN b.check_in AND b.check_out', { date })
      .getRawOne();

    return parseFloat(result.revenue) || 0;
  }

  async getKpis(hotelId: number, date: string) {
    const occupied = await this.bookingRepo
      .createQueryBuilder('b')
      .where('b.hotelId = :hotelId', { hotelId })
      .andWhere(':date BETWEEN b.check_in AND b.check_out', { date })
      .getCount();

    const available = await this.roomTypeRepo
      .createQueryBuilder('r')
      .where('r.hotelId = :hotelId', { hotelId })
      .getCount();

    const revenueResult = await this.bookingRepo
      .createQueryBuilder('b')
      .select('SUM(b.rate)', 'revenue')
      .where('b.hotelId = :hotelId', { hotelId })
      .andWhere(':date BETWEEN b.check_in AND b.check_out', { date })
      .getRawOne();

    const revenue = parseFloat(revenueResult.revenue) || 0;
    const revpar = available > 0 ? revenue / available : 0;
    const occupancy = available > 0 ? (occupied / available) * 100 : 0;

    return {
      hotelId,
      date,
      revenue: parseFloat(revenue.toFixed(2)),
      revpar: parseFloat(revpar.toFixed(2)),
      occupancy: parseFloat(occupancy.toFixed(2)),
    };
  }

  async getForecast(hotelId: number, startDate: string) {
    const available = await this.roomTypeRepo
      .createQueryBuilder('r')
      .where('r.hotelId = :hotelId', { hotelId })
      .getCount();

    const forecast: ForecastItem[] = [];

    for (let i = 0; i < 7; i++) {
      const date = dayjs(startDate).add(i, 'day').format('YYYY-MM-DD');

      const occupied = await this.bookingRepo
        .createQueryBuilder('b')
        .where('b.hotelId = :hotelId', { hotelId })
        .andWhere(':date = b.check_in', { date })
        .getCount();

      const revenueResult = await this.bookingRepo
        .createQueryBuilder('b')
        .select('SUM(b.rate)', 'revenue')
        .where('b.hotelId = :hotelId', { hotelId })
        .andWhere(':date = b.check_in', { date })
        .getRawOne();

      const revenue = parseFloat(revenueResult.revenue) || 0;
      const revpar = available > 0 ? revenue / available : 0;
      const occupancy = available > 0 ? (occupied / available) * 100 : 0;

      forecast.push({
        date,
        revenue: parseFloat(revenue.toFixed(2)),
        revpar: parseFloat(revpar.toFixed(2)),
        occupancy: parseFloat(occupancy.toFixed(2)),
      });
    }

    return {
      hotelId,
      startDate,
      forecast,
    };
  }


}

export interface ForecastItem {
  date: string;
  revenue: number;
  revpar: number;
  occupancy: number;
}
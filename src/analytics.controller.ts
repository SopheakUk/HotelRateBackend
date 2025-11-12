import { Controller, Get, Query } from '@nestjs/common';
import { AnalyticsService } from './analytics.service';
import { RevenueQueryDto } from './dto/revenue-query.dto';
import { KpiQueryDto } from './dto/kpi-query.dto';
import { ForecastQueryDto } from './dto/forecast-query.dto';
import { ApiTags, ApiOperation } from '@nestjs/swagger';


@Controller('analytics')
export class AnalyticsController {
  constructor(private readonly analyticsService: AnalyticsService) {}

  @Get('revenue')
  async getRevenue(@Query() query: RevenueQueryDto) {
    const revenue = await this.analyticsService.getDailyRevenue(query.hotelId, query.date);
    return { hotelId: query.hotelId, date: query.date, revenue };
  }

   @Get('kpis')
  @ApiOperation({ summary: 'Calculate RevPAR and Occupancy %' })
  async getKpis(@Query() query: KpiQueryDto) {
    return this.analyticsService.getKpis(query.hotelId, query.date);
  }

   @Get('forecast')
  @ApiOperation({ summary: 'Return 7-day forecast of revenue, RevPAR, and occupancy' })
  async getForecast(@Query() query: ForecastQueryDto) {
    return this.analyticsService.getForecast(query.hotelId, query.startDate);
  }


}
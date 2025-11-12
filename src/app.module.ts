import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Booking } from './entities/booking.entity';
import { Hotel } from './entities/hotel.entity';
import { RoomType } from './entities/room-type.entity';
import { AnalyticsController } from './analytics.controller';
import { AnalyticsService } from './analytics.service';
import { AnalyticsGateway } from './analytics.gateway';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost', // or your DB host
      port: 5432,
      username: 'postgres',
      password: '123',
      database: 'hotel',
      entities: [Booking, Hotel, RoomType],
      synchronize: true, // only for dev!
    }),
    TypeOrmModule.forFeature([Booking, Hotel, RoomType])],
  controllers: [AppController, AnalyticsController],
  providers: [AppService, AnalyticsService, AnalyticsGateway],
})



export class AppModule {}

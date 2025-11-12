import { IsInt, IsDateString } from 'class-validator';

export class ForecastQueryDto {
  @IsInt()
  hotelId: number;

  @IsDateString()
  startDate: string;
}
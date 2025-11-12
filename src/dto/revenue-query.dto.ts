import { IsDateString, IsInt } from 'class-validator';

export class RevenueQueryDto {
  @IsInt()
  hotelId: number;

  @IsDateString()
  date: string;
}
import { IsInt, IsDateString } from 'class-validator';

export class KpiQueryDto {
  @IsInt()
  hotelId: number;

  @IsDateString()
  date: string;
}
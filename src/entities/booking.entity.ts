import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Hotel } from './hotel.entity';
import { RoomType } from './room-type.entity';

@Entity('bookings')
export class Booking {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => Hotel, hotel => hotel.bookings)
  hotel: Hotel;

  @ManyToOne(() => RoomType, roomType => roomType.bookings)
  roomType: RoomType;

  @Column({ type: 'date' })
  check_in: string;

  @Column({ type: 'date' })
  check_out: string;

  @Column({ type: 'numeric', precision: 10, scale: 2 })
  rate: number;

  @Column({ type: 'int' })
  guests: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  created_at: Date;
}
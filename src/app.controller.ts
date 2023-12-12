import { Controller, Get, Render } from '@nestjs/common';
import * as mysql from 'mysql2';
import { AppService } from './app.service';
import { newMusicDto } from './newMusicDto';

const conn = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '',
  database: 'streaming_test',
}).promise();

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  @Render('index')
  index() {
    return { message: 'Kezdőoldal' };
  }

  @Get('/form')
  @Render('form')
  form() {
    return { title: 'Zene hozzáadása' };
  }
}

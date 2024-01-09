import { Body, Controller, Get, Post, Redirect, Render, Res, Session } from '@nestjs/common';
import * as mysql from 'mysql2';
import * as bcrypt from 'bcrypt';
import { AppService } from './app.service';
import { newMusicDto } from './newMusicDto';
import { newUserDto } from './newUserDto';
import { Response } from 'express';

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
  async index() {
    const [data] = await conn.execute('SELECT id, title, artist, length FROM musics ORDER BY artist, title');
    return { title: 'Kezdőoldal', index: data };
  }

  @Get('/form')
  @Render('form')
  form() {
    return { title: 'Zene hozzáadása', errors: [] };
  }

  @Post('/form')
  @Render('form')
  async formPost(@Body() newMusic: newMusicDto, @Res() res: Response) {
    const errors: string[] = [];
    if (newMusic.artist.trim() === '') {
      errors.push('Adja meg az előadó nevét!');
    }
    if (newMusic.title.trim() === '') {
      errors.push('Adja meg a zene címét!');
    }
    if (newMusic.length <= 50 || isNaN(newMusic.length)) {
      errors.push('A zene hossza legalább 50 másodperc kell legyen!');
    }

    if (errors.length > 0) {
      res.render('form', { title: 'Zene hozzáadása', errors });
    } else {
      const title: string = newMusic.title;
      const artist: string = newMusic.artist;
      const length: number = newMusic.length;
      const [data] = await conn.execute('INSERT INTO musics (title, artist, length) VALUES (?, ?, ?)', [title, artist, length]);
      res.redirect('/');
    }
  }

  @Get('/register')
  @Render('register')
  registerForm() {
    return { title: 'Regisztráció' };
  }

  @Post('/register')
  @Redirect()
  async register(@Body() newUser: newUserDto) {
    const username: string = newUser.username;
    const password: string = await bcrypt.hash(newUser.password, 10);
    await conn.execute('INSERT INTO users (username, password) VALUES (?, ?)', [username, password]);
    return {
      url: '/',
    };
  }
}

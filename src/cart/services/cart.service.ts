import { Injectable } from '@nestjs/common';
import { Cart } from '../models';
import { lookup } from 'src/database/utils';

@Injectable()
export class CartService {

  async findByUserId(userId: string) {
    const query = `SELECT * FROM carts where id = '${userId}'`;
    const cart = await lookup(query);

    return cart;
  }

  async createByUserId(userId: string) {
    const query = `INSERT INTO cart(userId) VALUES(${userId}) RETURNING *`;

    const userCart = await lookup(query);
    return userCart;
  }

  async findOrCreateByUserId(userId: string) {
    const userCart = await this.findByUserId(userId);

    if (userCart) {
      return userCart;
    }

    return this.createByUserId(userId);
  }

  async updateByUserId(userId: string, { items }: Cart) {
    const query = `UPDATE cart_items SET items = ${items} where id = '${userId} RETURNING *`;

    return await lookup(query);
  }

  removeByUserId(userId: string): void {
    const query = `DELETE FROM carts WHERE userId = ${userId};`;

    lookup(query);
  }
}
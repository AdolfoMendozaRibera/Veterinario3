import { Injectable } from '@nestjs/common';


@Injectable()
export class AppService {
    getHello(): string {
        return 'Hello World! This the main page.';
    }
}

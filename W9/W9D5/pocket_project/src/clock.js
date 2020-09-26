import { htmlGenerator } from "./warmup";
export class Clock {
    constructor(divClock) {
        const clock = new Date();
        this.hour = clock.getHours();
        this.minute = clock.getMinutes();
        this.second = clock.getSeconds();
        this._tick = this._tick.bind(this);
        this.second_counter = this.second;
        this.minute_counter = this.minute;
        this.hour_counter = this.hour;
        this.printTime(divClock);
        setInterval(this._tick, 1000);
    }

    printTime(divclock) {
        // console.log(`${this.hour}:${this.minute}:${this.second}`);
        const string = `${this.hour}:${this.minute}:${this.second}`;

        htmlGenerator(string, divClock);
    }

    _tick() {
        this.second_counter += 1;
        let minute_passed = Math.floor(this.second_counter / 60);
        let hour_passed = Math.floor(
            (this.minute_counter + minute_passed) / 60
        );

        this.second = this.second_counter % 60;
        this.minute = (this.minute_counter + minute_passed) % 60;
        this.hour = (this.hour_counter + hour_passed) % 24;
        this.printTime();

        // 1. Increment the time by one second.
        // 2. Call printTime.
    }
}

const divClock = document.querySelector("#clock");
const clock = new Clock(divClock);

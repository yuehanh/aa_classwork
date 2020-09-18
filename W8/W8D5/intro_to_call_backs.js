class Clock {
    constructor() {
        const clock = new Date('July 20, 69 23:59:58');
        this.hour = clock.getHours();
        this.minute = clock.getMinutes();
        this.second = clock.getSeconds();
        this._tick = this._tick.bind(this)
        this.second_counter = this.second
        this.minute_counter = this.minute
        this.hour_counter = this.hour
        this.printTime();
        setInterval(this._tick,1000);
      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
    }
  
    printTime() {
      console.log(`${this.hour}:${this.minute}:${this.second}`)
    }
  
    _tick() {
        this.second_counter += 1
        let minute_passed = Math.floor((this.second_counter / 60))
        let hour_passed =  Math.floor(((this.minute_counter + minute_passed) / 60))
  
        this.second = (this.second_counter) % 60
        this.minute = (this.minute_counter + minute_passed ) % 60
        this.hour = (this.hour_counter + hour_passed) % 24
        this.printTime()
        
      // 1. Increment the time by one second.
      // 2. Call printTime.
    }
}
  
const clock = new Clock();
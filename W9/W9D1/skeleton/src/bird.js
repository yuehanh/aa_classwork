export default class Bird{
    constructor(dimensions){
        this.dimensions = dimensions;
        this.positions = {x: this.dimensions.width / 3,
                        y: this.dimensions.height / 2};
        this.velocity = 0;
    }
    
    drawBird(ctx){
        ctx.fillStyle = "yellow";
        ctx.fillRect(this.positions.x, this.positions.y, 40, 30);
    }
    animate(ctx){
        this.drawBird(ctx)
    }
}
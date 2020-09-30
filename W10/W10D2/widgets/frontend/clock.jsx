import React from "react";

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = { time: new Date() };
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({ time: new Date() });
    }

    componentDidMount() {
        this.intervalId = setInterval(this.tick, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);
    }

    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let secs = this.state.time.getSeconds();
        let date = this.state.time.toDateString();

        hours = hours < 10 ? `0${hours}` : hours;
        minutes = minutes < 10 ? `0${minutes}` : minutes;
        secs = `0${secs}`.slice(-2);

        //QUESTION - div className does not appear for time and date divs
        return (
            <div>
                <h1>Clock </h1>
                <div className="clock">
                    <div className="time">
                        <h1>Time: </h1>
                        <h1>
                            {hours}:{minutes}:{secs}
                        </h1>
                    </div>
                    <div className="date">
                        <h1>Date: </h1>
                        <h1>{date}</h1>
                    </div>
                </div>
            </div>
        );
    }
}

export default Clock;

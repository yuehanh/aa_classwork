import React from "react";

class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = { itemIndex: 0 };
        this.selectItems = this.selectItems.bind(this);
    }
    selectItems(num) {
        this.setState({ itemIndex: num });
    }
    render() {
        const item = this.props.items[this.state.itemIndex];
        const content = item.content;
        return (
            <div>
                <h1>Tabs</h1>
                <div className="tabs">
                    <Headers
                        items={this.props.items}
                        selection={this.selectItems}
                        selected={this.state.itemIndex}
                    ></Headers>
                    <article className="tab-content">{content}</article>
                </div>
            </div>
        );
    }
}

class Headers extends React.Component {
    //props are automatically passed and saved

    render() {
        const headers = this.props.items.map((header, idx) => {
            return (
                <li
                    key={idx}
                    onClick={() => {
                        this.props.selection(idx);
                    }}
                    className={idx === this.props.selected ? "active" : ""}
                >
                    {header.title}
                </li>
            );
        });

        return <ul className="tab-header">{headers}</ul>;
    }
}

export default Tabs;

import React from "react";

export default class PokemonDetail extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.requestAPoke(this.props.match.params.pokemonId);
    }

    componentDidUpdate(prevProps) {
        if (
            prevProps.match.params.pokemonId !==
            this.props.match.params.pokemonId
        ) {
            this.props.requestAPoke(this.props.match.params.pokemonId);
        }
    }

    render() {
        const { poke, items } = this.props;
        debugger
        return (
            <section>
                <img src={poke.image_url} />

                <ul>
                    <li>{poke.name}</li>
                    <li>{poke.poke_type}</li>
                    <li>{poke.attack}</li>
                    <li>{poke.defense}</li>
                    <li>{poke.moves.join(", ")}</li>
                </ul>
            </section>
        );
    }
}

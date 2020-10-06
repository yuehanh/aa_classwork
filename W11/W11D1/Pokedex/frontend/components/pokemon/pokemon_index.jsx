import React from "react";

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {
        const pokemonList = this.props.pokemon.map((poke) => {
            return (
                <li key={poke.id}>
                    <img src={poke.image_url} />
                    {poke.name}
                </li>
            );
        });

        return <ul>{pokemonList}</ul>;
    }
}

export default PokemonIndex;

import React from "react";
import { HashRouter, Route } from 'react-router-dom'

import PokemonIndexItem from "./pokemon_index_item";
import PokemonDetailContainer from './pokemon_detail_container'
class PokemonIndex extends React.Component {
    constructor(props) {
        super(props);
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {
        const pokemonItems = this.props.pokemon.map((poke) => {
            return <PokemonIndexItem key={poke.id} pokemon={poke} />;
        });
        // debugger
        return (
            <section className="pokedex">
                <Route
                    path="/pokemon/:pokemonId"
                    component={PokemonDetailContainer}
                ></Route>
                <ul>{pokemonItems}</ul>
            </section>
        );

        // const pokemonList = this.props.pokemon.map((poke) => {
        //     return (
        //         <li key={poke.id}>
        //             <img src={poke.image_url} />
        //             {poke.name}
        //         </li>
        //     );
        // });

        // return <ul>{pokemonList}</ul>;
    }
}

export default PokemonIndex;

import { connect } from "react-redux";
import { requestAPoke } from "../../actions/pokemon_actions";
import { selectAllPokeItems } from "../../reducers/selectors";
import PokemonDetail from "./pokemon_detail"


const mapStateToProps = (state, ownProps) => {
    const poke = state.entities.pokemon[ownProps.match.params.pokemonId]
    // debugger
    return {
        poke,
        items: selectAllPokeItems(state, poke.item_ids)
    }
};

const mapDispatchToProps = (dispatch) => ({
    requestAPoke: (id) => dispatch(requestAPoke(id)),
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
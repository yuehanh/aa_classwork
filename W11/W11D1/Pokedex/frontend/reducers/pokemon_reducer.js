import {
    RECEIVE_ALL_POKEMON,
    RECEIVE_A_POKE,
} from "../actions/pokemon_actions";

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = {};

    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            nextState = action.pokemon;
            return nextState;
        case RECEIVE_A_POKE:
            const detail = action.poke.pokemon;
            nextState = Object.assign({}, state);
            nextState[detail.id] = detail;
            // nextState = Object.assign({}, state, {[detail.id]: detail});
            return nextState;
        default:
            return state;
    }
};

export default pokemonReducer;

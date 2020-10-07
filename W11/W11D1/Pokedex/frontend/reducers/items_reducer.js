import { RECEIVE_A_POKE } from "../actions/pokemon_actions";

const itemsReducer = (state = {}, action) => {
    Object.freeze(state);
    let nextState = {};

    switch (action.type) {
        case RECEIVE_A_POKE:
            nextState = action.poke.items;
            return nextState;
        default:
            return state;
    }
};

export default itemsReducer;

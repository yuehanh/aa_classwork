export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
import * as APIUtil from "../util/api_util";

export const receiveAllPokemon = (pokemon) => {
    // debugger
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemon,
    };
};

export const requestAllPokemon = () => {
    // debugger;
    return (dispatch) => {
        // debugger;
        APIUtil.fetchAllPokemon().then((pokemon) => {
            // debugger;
            return dispatch(receiveAllPokemon(pokemon));
        });
    };
};

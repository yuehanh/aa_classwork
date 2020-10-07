export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_A_POKE = "RECEIVE_A_POKE";
import * as APIUtil from "../util/api_util";

export const receiveAPoke = (poke) => {
    return {
        type: RECEIVE_A_POKE,
        poke,
    };
};

export const receiveAllPokemon = (pokemon) => {
    // debugger
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemon,
    };
};

export const requestAPoke = (id) => {
    return (dispatch) => {
        APIUtil.fetchAPoke(id).then((poke) => {
            return dispatch(receiveAPoke(poke));
        });
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

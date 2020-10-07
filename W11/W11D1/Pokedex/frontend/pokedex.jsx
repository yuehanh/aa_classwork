import React from "react";
import ReactDom from "react-dom";
import * as APIUtil from "./util/api_util";
import { receiveAllPokemon, requestAllPokemon, receiveAPoke, requestAPoke } from "./actions/pokemon_actions";
import configureStore from "./store/store";
import {selectAllPokemon} from './reducers/selectors'

//component
import Root from "./components/root"

document.addEventListener("DOMContentLoaded", () => {
    const rootEl = document.getElementById("root");
    const store = configureStore();
    ReactDom.render(<Root store = {store} />, rootEl);

    // test
    window.store = store;
    window.getState = store.getState;
    window.banana = store.dispatch;
    window.selectAllPokemon = selectAllPokemon;

    window.fetchAllPokemon = APIUtil.fetchAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;
    window.requestAllPokemon = requestAllPokemon;
    
    window.fetchAPoke = APIUtil.fetchAPoke;
    window.receiveAPoke = receiveAPoke;
    window.requestAPoke = requestAPoke;
    
});

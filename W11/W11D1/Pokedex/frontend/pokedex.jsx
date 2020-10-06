import React from "react";
import ReactDom from "react-dom";
import * as APIUtil from "./util/api_util";
import { receiveAllPokemon, requestAllPokemon } from "./actions/pokemon_actions";
import configureStore from "./store/store";
import {selectAllPokemon} from './reducers/selectors'

//component
import Root from "./components/root"

document.addEventListener("DOMContentLoaded", () => {
    const rootEl = document.getElementById("root");
    const store = configureStore();
    ReactDom.render(<Root store = {store} />, rootEl);

    // test
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.fetchAllPokemon = APIUtil.fetchAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;
    window.requestAllPokemon = requestAllPokemon;
    window.selectAllPokemon = selectAllPokemon;
});

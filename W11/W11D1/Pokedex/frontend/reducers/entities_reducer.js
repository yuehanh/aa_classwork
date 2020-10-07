import { combineReducers } from "redux";
import itemsReducer from "./items_reducer";
import pokemonReducer from "./pokemon_reducer";


const entitiesReducer = combineReducers({
    pokemon: pokemonReducer,
    items: itemsReducer,
});

export default entitiesReducer;

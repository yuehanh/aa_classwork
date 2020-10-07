export const selectAllPokemon = (state) => {
    return Object.values(state.entities.pokemon);
};

export const selectAllPokeItems = (state, id_arrays) => {
    return id_arrays ? id_arrays.map((id) => state.entities.items[id]) : [];
};

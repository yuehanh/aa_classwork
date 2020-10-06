export const fetchAllPokemon = () => {
    // debugger
    return $.ajax({
        url: "api/pokemon",
        method: "GET",
    });
};


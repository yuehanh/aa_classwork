import React from 'react'
import { Link } from "react-router-dom";

const pokemonIndexItem = (props) => {
  return (
    <li>
      <Link to={`/pokemon/${props.pokemon.id}`}>
        <img src={props.pokemon.image_url} />
        {props.pokemon.name} 
      </Link>
    </li>
  )
}

export default pokemonIndexItem;
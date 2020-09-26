export const dogs = {
    Corgi: "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
    "Australian Shepherd":
        "https://www.akc.org/dog-breeds/australian-shepherd/",
    Affenpinscher: "https://www.akc.org/dog-breeds/affenpinscher/",
    "American Staffordshire Terrier":
        "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
    Tosa: "https://www.akc.org/dog-breeds/tosa/",
    "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
    "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/",
};
function dogLinkCreator(dogs) {
    let dogLinks = [];
    for (const dog in dogs) {
        let dogLink = document.createElement("a");
        dogLink.innerHTML = dog;
        dogLink.href = dogs[dog];
        let dogItem = document.createElement("li");
        dogItem.className = "dog-link";
        dogItem.append(dogLink);
        dogLinks.push(dogItem);
    }
    return dogLinks;
}
const ul = document.querySelector(".drop-down-dog-list");

function attachDogLinks() {
    const dogLinks = dogLinkCreator(dogs);
    for (const link of dogLinks) {
        ul.append(link);
    }
}

attachDogLinks();

const nav = document.querySelector(".drop-down-dog-nav");
nav.addEventListener("mouseenter", function () {
    ul.classList.remove("hidden");
});

nav.addEventListener("mouseleave", function () {
    ul.classList.add("hidden");
});

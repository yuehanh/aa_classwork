const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    const newP = document.createElement("p");
    newP.textContent = string;
    htmlElement.innerText = newP.textContent
};

htmlGenerator('Party Time.', partyHeader);
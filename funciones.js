let heroes = [
    {hero_name: "Abe Sapien", gender: "Male", alignment: "good"},
    {hero_name: "Abin Sur", gender: "Male", alignment: "good"},
    {hero_name: "Abomination", gender: "Male", alignment: "bad"},
    {hero_name: "Abraxas", gender: "Male", alignment: "bad"},
    {hero_name: "Absorbing Man", gender: "Male", alignment: "bad"}
]

function goodHeroes(heroes) {
    return heroes.filter(hero => hero.alignment === "good")
}

function heroNames(heroes) {
    return heroes.map(hero => hero.hero_name);
}

function goodHeroesNames(heroes) {
    return heroes.filter(hero => hero.alignment === "good").map(hero => hero.hero_name);
}


console.log(goodHeroes(heroes));
console.log(heroNames(heroes));
console.log(goodHeroesNames(heroes));
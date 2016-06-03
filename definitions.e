<'

//  Types and struct definitions
type nationality_t : [ENGLISH, SPANISH, UKRANIAN, NORWEGIAN, JAPANESE];
type color_t : [RED, GREEN, IVORY, YELLOW, BLUE];
type pet_t : [DOG, SNAILS, FOX, HORSE, ZEBRA];
type drink_t : [COFFEE, TEA, MILK, ORANGE_JUICE, WATER];
type cigarettes_t : [OLD_GOLD, KOOL, CHESTERFIELD, LUCKY_STRIKE, PARLIAMENT];


struct house_s {
    color : color_t;
    nationality : nationality_t;
    pet : pet_t;	 
    drink : drink_t;
    cigarettes : cigarettes_t;
    print_me() is {messagef(NONE, "House Info %s %s %s %s %s",color,nationality,pet,drink,cigarettes)};
};


struct neighborhood_s{
    houses[5] : list of house_s;
    
    keep houses.all_different(it.nationality);
    keep houses.all_different(it.pet);
    keep houses.all_different(it.color);
    keep houses.all_different(it.drink);
    keep houses.all_different(it.cigarettes); 
};
'>

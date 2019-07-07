const mocks = {
      Query: () => ({
        user: () => ({
          favoriteFoods: [
            {foodItem: {name: 'Spaghetti'}, eatingFrequency: 'WEEKLY'},
            {foodItem: {name: 'Coconut Water'}, eatingFrequency: 'DAILY'},
          ],
        }),
      }),
};
const serializedMocks = Object.keys(mocks).reduce(
    (packet, key) => Object.assign(packet, {[key]: mocks[key].toString()}),
    {}
);

console.log(serializedMocks);

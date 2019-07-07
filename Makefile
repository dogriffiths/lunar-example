QUERY=curl -i -H 'content-type: application/json' -XPOST 'http://localhost:3001/graphql' -d '{"operationName":"User","variables":{"id":1},"query":"query User($$id: ID!) {\n  user(id: $$id) {\n    id\n    name\n    ...FavoriteFoodsListDisplay\n  }\n}\n\nfragment FavoriteFoodsListDisplay on User {\n  favoriteFoods {\n    ...FavoriteFoodItemDisplay\n  }\n}\n\nfragment FavoriteFoodItemDisplay on FavoriteFoodItem {\n  id\n  foodItem {\n    id\n    name\n  }\n  eatingFrequency\n}\n"}'

reset:
	curl -i  -XPOST 'http://localhost:3001/store/reset'

mock_apple: reset
	curl -i -H 'content-type: application/json' -XPOST 'http://localhost:3001/store/mock' -d '{"Query": "() => ({user: () => ({favoriteFoods: [{foodItem: {name: '"'"'Spaghetti'"'"'}, eatingFrequency: '"'"'WEEKLY'"'"'}, {foodItem: {name: '"'"'Apple Juice'"'"'}, eatingFrequency: '"'"'DAILY'"'"'},],}),})"}'

mock_fish: reset
	curl -i -H 'content-type: application/json' -XPOST 'http://localhost:3001/store/mock' -d '{"Query": "() => ({user: () => ({favoriteFoods: [{foodItem: {name: '"'"'Spaghetti'"'"'}, eatingFrequency: '"'"'WEEKLY'"'"'}, {foodItem: {name: '"'"'Fish Juice'"'"'}, eatingFrequency: '"'"'DAILY'"'"'},],}),})"}'

test_apple: mock_apple
	$(QUERY)

test_fish: mock_fish
	$(QUERY)


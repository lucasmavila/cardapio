const storesDataSet = [
  {
    "id": "1",
    "status": "active",
    "logo":
        "https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=200",
    "name": "Hamburgueria do José",
    "address": {
      "cep": "03043020",
      "state": "MG",
      "city": "Manhuaçu",
      "number": 123
    },
    "primaryColor": null,
    "secondaryColor": null,
    "menu": [
      {
        "name": "Cheddar Bacon",
        "category": "food",
        "description":
            "pão, burguer 150g, ovo, bacon, cheddar, tomate, cebola e molho",
        "mainPhoto": 0,
        "price": 16.5,
        "images": [
          "https://images.unsplash.com/photo-1595531172949-30922c28a240?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=200",
          "https://images.unsplash.com/photo-1623944637197-814c1020ddd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=200"
        ],
        "additionalItems": [
          {"name": "alface", "price": 1.00},
          {"name": "bacon", "price": 2.00},
          {"name": "burguer", "price": 3.00},
          {"name": "cebola", "price": 1.00},
        ]
      },
      {
        "name": "Veg Burguer",
        "category": "food",
        "description": "pão, burguer veg 150g, cheddar, tomate, cebola e molho",
        "mainPhoto": 0,
        "price": 18.5,
        "images": [
          "https://images.unsplash.com/photo-1551615593-ef5fe247e8f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=200"
        ],
        "additionalItems": [
          {"name": "alface", "price": 1.00},
          {"name": "cheddar", "price": 3.00},
          {"name": "burguer veg", "price": 4.00},
          {"name": "cebola", "price": 1.00},
        ]
      },
      {
        "name": "French Fries",
        "category": "food",
        "description": "200g fritas",
        "mainPhoto": 0,
        "price": 12.5,
        "images": [
          "https://images.unsplash.com/photo-1573080496219-bb080dd4f877?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=200",
          "https://images.unsplash.com/photo-1580559489333-755f7e3c8949?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=200"
        ],
        "additionalItems": null
      }
    ],
  },
  {
    "id": "2",
    "name": "Pizzaria Forno de Pedra",
    "status": "active",
    "address": {
      "cep": "03043020",
      "state": "MG",
      "city": "Viçosa",
      "number": 123
    },
    "logo": null,
    "primaryColor": null,
    "secondaryColor": null,
    "menu": [
      {
        "name": "Margerita",
        "category": "food",
        "description": "mussarela, tomate, oregano, manjericão, molho",
        "mainPhoto": 0,
        "price": 16.5,
        "images": [
          "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
          "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"
        ],
        "additionalItems": [
          {"name": "borda de catupiry", "price": 3.00},
          {"name": "borda de cheddar", "price": 3.00},
          {"name": "borda de chocolate", "price": 3.00},
          {"name": "bacon", "price": 2.00},
          {"name": "cebola", "price": 1.00},
        ]
      },
      {
        "name": "Veg Pizza",
        "category": "food",
        "description": "mussarela, tomate, oregano, manjericão, molho",
        "mainPhoto": 1,
        "price": 18.5,
        "images": [
          "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
          "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"
        ],
        "additionalItems": [
          {"name": "alface", "price": 1.00},
          {"name": "cheddar", "price": 3.00},
          {"name": "burguer veg", "price": 4.00},
          {"name": "cebola", "price": 1.00},
        ]
      },
      {
        "name": "French Fries",
        "category": "food",
        "description": "400g fritas",
        "mainPhoto": 0,
        "price": 12.5,
        "images": [
          "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
          "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"
        ],
        "additionalItems": null
      }
    ],
  },
  {
    "id": "3",
    "name": "Dogão",
    "status": "inactive",
    "address": {
      "cep": "03043020",
      "state": "MG",
      "city": "Manhuaçu",
      "number": 123
    },
    "logo": null,
    "primaryColor": null,
    "secondaryColor": null,
    "menu": null
  },
  {
    "id": "4",
    "logo": null,
    "address": {
      "cep": "03043020",
      "state": "MG",
      "city": "Viçosa",
      "number": 123
    },
    "primaryColor": null,
    "secondaryColor": null,
    "status": "inactive",
    "name": "Pizzaria LevePizza",
    "menu": null
  },
  {
    "id": "5",
    "logo": null,
    "address": {
      "cep": "03043020",
      "state": "MG",
      "city": "Manhuaçu",
      "number": 123
    },
    "primaryColor": null,
    "secondaryColor": null,
    "status": "inactive",
    "name": "Pizzaria +Pizza",
    "menu": null
  },
  {
    "id": "6",
    "logo": null,
    "address": {
      "cep": "03043020",
      "state": "MG",
      "city": "Viçosa",
      "number": 123
    },
    "primaryColor": null,
    "secondaryColor": null,
    "status": "inactive",
    "name": "Hakuna Batata",
    "menu": null
  },
  {
    "id": "7",
    "logo": null,
    "address": {
      "cep": "03043020",
      "state": "MG",
      "city": "Viçosa",
      "number": 123
    },
    "primaryColor": null,
    "secondaryColor": null,
    "status": "inactive",
    "name": "Mega Lanche",
    "menu": null
  }
];

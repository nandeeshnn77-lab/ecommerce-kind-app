import React, { useEffect, useState } from "react";

import { createRoot } from "react-dom/client";

import "./style.css";

function App() {

    const [products, setProducts] = useState([]);

    useEffect(() => {

        fetch("/api/products")
            .then(response => response.json())
            .then(data => setProducts(data))
            .catch(error => console.error(error));

    }, []);

    return (

        <div>

            <header>

                <h1>🛒 DevShop</h1>

                <p>Modern E-Commerce Store</p>

            </header>

            <main>

                <h2>Featured Products</h2>

                <div className="products">

                    {products.map(product => (

                        <div className="card"
                             key={product.id}>

                            <img
                                src={product.image}
                                alt={product.name}
                            />

                            <h3>{product.name}</h3>

                            <p>{product.description}</p>

                            <h3>
                                ₹{product.price}
                            </h3>

                            <button>
                                Add to Cart
                            </button>

                        </div>

                    ))}

                </div>

            </main>

        </div>
    );
}

createRoot(
    document.getElementById("root")
).render(<App />);

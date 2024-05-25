def FirebaseInsert(name):
    import firebase_admin
    from firebase_admin import credentials, firestore

    # Initialize Firebase Admin SDK
    cred = credentials.Certificate("/Users/darrick/Desktop/securus-hacksg-firebase-adminsdk-3myzp-ed41f35824.json")
    firebase_admin.initialize_app(cred)

    # Initialize Firestore
    db = firestore.client()

    # Define the data to be inserted (example data)
    data = {
        "transport": 100.0,
        "food": 200.0,
        "entertainment": 150.0,
        "shopping": 250.0,
        "education": 300.0,
        "travel": 400.0,
        "services": 120.0,
        "personal care": 80.0,
        "bills": 500.0,
        "insurance": 60.0
    }

    # Insert data into Firestore
    doc_ref = db.collection("expenses").document(f"{name}")
    doc_ref.set(data)

    print("Data inserted successfully!")

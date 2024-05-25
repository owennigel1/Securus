
def FirebaseRead (name):
    import firebase_admin
    from firebase_admin import credentials, firestore

    # Initialize Firebase Admin SDK
    cred = credentials.Certificate("/Users/darrick/Desktop/securus-hacksg-firebase-adminsdk-3myzp-ed41f35824.json")
    firebase_admin.initialize_app(cred)

    # Initialize Firestore
    db = firestore.client()

    # Retrieve data from Firestore
    doc_ref = db.collection("expenses").document(f"{name}")
    doc = doc_ref.get()
    if doc.exists:
        print("Document data:", doc.to_dict())
    else:
        print("No such document!")
        return 0

    return doc

import firebase_admin
from firebase_admin import credentials, firestore

# Initialize Firebase Admin SDK and Firestore client only once
cred = credentials.Certificate("/Users/darrick/Desktop/securus-hacksg-firebase-adminsdk-3myzp-ed41f35824.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

def FirebaseRead(collection,document):
    try:
        # Retrieve data from Firestore
        doc_ref = db.collection(collection).document(document)
        doc = doc_ref.get()
        if doc.exists:
            print("Document data:", doc.to_dict())
            return doc.to_dict()
        else:
            print("No such document!")
            return None
    except Exception as e:
        print(f"An error occurred while reading the document: {e}")
        return None

def FirebaseInsert(collection, document, data):
    try:
        # Insert data into Firestore
        doc_ref = db.collection(collection).document(document)
        doc_ref.set(data)
        print("Data inserted successfully!")
    except Exception as e:
        print(f"An error occurred while inserting the document: {e}")

def FirebaseUpdate(collection, document, updates):
    try:
        # Update data in Firestore
        doc_ref = db.collection(collection).document(document)
        doc_ref.update(updates)
        print("Data updated successfully!")
    except Exception as e:
        print(f"An error occurred while updating the document: {e}")

def FirebaseDelete(collection, document):
    try:
        # Reference to the document to be deleted
        doc_ref = db.collection(collection).document(document)

        # Delete the document
        doc_ref.delete()
        print("Document deleted successfully!")
    except Exception as e:
        print(f"An error occurred while deleting the document: {e}")


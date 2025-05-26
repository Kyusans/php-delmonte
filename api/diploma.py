# pip install flask transformers pillow torch flask-cors
# run sa terminal: python diploma.py
from flask import Flask, request, jsonify
from flask_cors import CORS
from PIL import Image
from transformers import BlipProcessor, BlipForQuestionAnswering
import io

app = Flask(__name__)
CORS(app)

# CORS(app, resources={r"/api/*": {"origins": "http://localhost:3000"}})

# Load the model and processor once when the server starts
processor = BlipProcessor.from_pretrained("Salesforce/blip-vqa-base")
model = BlipForQuestionAnswering.from_pretrained("Salesforce/blip-vqa-base")

@app.route('/api/diploma', methods=['POST'])
def check_diploma():
    if 'image' not in request.files:
        return jsonify({"error": "No image uploaded"}), 400

    file = request.files['image']
    image = Image.open(io.BytesIO(file.read())).convert('RGB')
    question = "Is this a real diploma?"

    inputs = processor(image, question, return_tensors="pt")
    out = model.generate(**inputs)
    answer = processor.decode(out[0], skip_special_tokens=True)

    result = 1 if answer.lower() == "yes" else 0
    return jsonify({"answer": answer, "result": result})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000)




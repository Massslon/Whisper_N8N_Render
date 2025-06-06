from fastapi import FastAPI, UploadFile, File
import whisper
import uvicorn
import os
import tempfile

app = FastAPI()
model = whisper.load_model("base")  # use "tiny" se quiser mais rápido e leve

@app.post("/transcribe")
async def transcribe_audio(file: UploadFile = File(...)):
    # Salva o arquivo temporariamente com extensão original
    temp_dir = tempfile.mkdtemp()
    temp_path = os.path.join(temp_dir, file.filename)

    with open(temp_path, "wb") as f:
        f.write(await file.read())

    # Transcreve com whisper
    result = model.transcribe(temp_path)

    # Limpa
    os.remove(temp_path)
    os.rmdir(temp_dir)

    return {"text": result["text"]}

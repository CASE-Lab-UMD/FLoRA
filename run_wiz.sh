pip install -r requirements.txt
git clone https://github.com/EleutherAI/lm-evaluation-harness
cd lm-evaluation-harness
pip install -e .
cd ../
python main.py --global_model 'TinyLlama/TinyLlama-1.1B-Chat-v1.0' --data_path  "./data_wiz" --output_dir './nips-tinyllama-full-wiz-1-1-10/' --num_communication_rounds 1 --local_num_epochs 1 --full True
python main.py --global_model 'huggyllama/llama-13b' --data_path  "./data_wiz" --output_dir './nips-llama13b-full-wiz-1-3-10/' --num_communication_rounds 1 --local_num_epochs 3 --full True
python main.py --global_model 'huggyllama/llama-13b' --data_path  "./data_wiz" --output_dir './nips-llama13b-full-wiz-3-1-10/' --num_communication_rounds 3 --local_num_epochs 1 --full True
lm_eval --model_args pretrained=./nips-llama13b-full-wiz-1-3-10/10/0/,parallelize=True,load_in_4bit=False, --tasks arc_challenge --num_fewshot 25 --batch_size 16 --output_path ./nips-llama13b-full-wiz-1-3-10/10/0/
lm_eval --model_args pretrained=./nips-llama13b-full-wiz-3-1-10/10/2/,parallelize=True,load_in_4bit=False, --tasks arc_challenge --num_fewshot 25 --batch_size 16 --output_path ./nips-llama13b-full-wiz-3-1-10/10/2/

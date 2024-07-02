PRE_SEQ_LEN=128
CHECKPOINT=adgen-chatglm2-6b-pt-128-2e-2
STEP=1000
NUM_GPUS=4

torchrun --standalone --nnodes=1 --nproc-per-node=$NUM_GPUS main.py \
    --do_predict \
    --validation_file /root/data1/ChatGLM2-6B/ptuning/data/Diabetes_valuate_1109.json \
    --test_file /root/data1/ChatGLM2-6B/ptuning/data/Diabetes_valuate_1109.json \
    --overwrite_cache \
    --prompt_column prompt \
    --response_column response \
    --model_name_or_path /root/data1/ChatGLM2-6B/THUDM/chatglm2-6b \
    --ptuning_checkpoint /root/data1/ChatGLM2-6B/ptuning/output/chatdoctor10116-128-chatglm2-6b-pt-128-2e-2/checkpoint-3000 \
    --output_dir /root/data1/ChatGLM2-6B/ptuning/output/chatdoctor10116-128-chatglm2-6b-pt-128-2e-2/checkpoint-3000/evaluate \
    --overwrite_output_dir \
    --max_source_length 128 \
    --max_target_length 128 \
    --per_device_eval_batch_size 1 \
    --predict_with_generate \
    --pre_seq_len $PRE_SEQ_LEN 
    # --quantization_bit 4

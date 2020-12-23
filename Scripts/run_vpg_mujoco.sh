#!/usr/bin/env bash

envs=(HalfCheetah-v3 Hopper-v3 Walker2d-v3 Swimmer-v3 Ant-v3 BipedalWalker-v3)
# envs=(BipedalWalker-v3)
seeds=10
max_iter=2000

version=tf2
alg=VPG
for (( j = 2; j <= seeds; ++j )); do
    for (( i = 0; i < ${#envs[@]}; ++i )); do
        echo ============================================
        echo starting Env: ${envs[$i]} ----- Exp_id $j

        python -m Algorithms.${version}.${alg}.main --env_id ${envs[$i]} --max_iter ${max_iter} --model_path Algorithms/${version}/${alg}/trained_models --seed $j --num_process 1 --batch_size 1024

        echo finishing Env: ${envs[$i]} ----- Exp_id $j
        echo ============================================
    done
done


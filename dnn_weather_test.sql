------------Create DNN Regressor Model--------
CREATE MODEL capstonedataset.mdl_dnn_weather1

OPTIONS(MODEL_TYPE='DNN_REGRESSOR',
        ACTIVATION_FN = 'RELU',
        BATCH_SIZE = 16,
        DROPOUT = 0.1,
        EARLY_STOP = FALSE,
        HIDDEN_UNITS = [64,16, 4],
        INPUT_LABEL_COLS = ['total_kwh_per_day'],
        LEARN_RATE=0.001,
        MAX_ITERATIONS = 50,
        OPTIMIZER = 'RMSPROP',
        DATA_SPLIT_METHOD = 'RANDOM',
        DATA_SPLIT_EVAL_FRACTION = 0.2
)
AS SELECT * FROM capstonedataset.power_and_weather;

----------Evaluate model----------------
SELECT * 
FROM ML.EVALUATE(MODEL capstonedataset.mdl_dnn_weather1)
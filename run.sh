# Clean old files
#rm -f proto/dnn0 dnn/init/hmmdefs

# Initiate the initial DNN model
#python GenInitDNN.py -v dnn_settings/HTE.dnn.am proto/dnn0
#cp dnn0 ../proto

#Connect the output of GMM model with the DNN ones
 #../../bin.cpu/HHEd -H hmm_model/hmmdefs -M dnn/init connect.hed  Embedded/tiedlist

# Variance vector generator
#../../bin.cpu/HCompV -p *%%% -k *.%%% -C config_files/cvn.cfg -q v -c cvn -S label_files/dnn.train.scp

# Frame-align the data
# ../../bin.cpu/HVite  -H hmm_model/hmmdefs -S label_files/train.scp -I lista.mlf -i aligned.mlf -f -o MW -a -y lab hmm_model/smarthomes.dict hmm_model/hmmlist

# Pretrain stage
  ../../bin.cpu/HNTrainSGD -C config_files/config.basic -C config_files/config.pretrain -H dnn/initial_model/hmmdefs \
  -M dnn -S label_files/train.scp -N label_files/valid.scp -l LABEL -I mlf_files/aligned.mlf hmm_model/hmmlist

 # Fine-tuning stage
 #../../bin.cpu/HNTrainSGD -C config_files/config.basic -C config_files/config.finetune -H dnn/hmmdefs \
 #-M dnn/finetune -S label_files/train.scp -N label_files/valid.scp -l LABEL -I mlf_files/aligned.mlf hmm_model/hmmlist

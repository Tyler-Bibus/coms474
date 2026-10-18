# coms474
My Project for my Introduction to machine learning computer science course.

# Project Description
This project compares an AlexNet-style Convolutional Neural Network (CNN) with a Vision Transformer (ViT) using learned 1D position embeddings on TinyImageNet. The comparison measures how convolutional feature extraction and self-attention perform with similar parameter counts and training budgets.

## Dataset
This project shall use the TinyImageNet dataset, which is a offshoot of ImageNet.
TinyImageNet has 200 classes, and images are smaller (only 64x64x3).

The reason I chose TinyImageNet is that with my GPU to accelerate training and eval should take a reasonable amount of time compared to ImageNet.

## Models
### Convolutional Neural Net
An AlexNet-style model adapted to 64×64 images, with five convolution layers and three linear layers defined using `torch.nn.Sequential`. It has 4,755,464 parameters.

### Vision Transformer (ViT)
A ViT with linear projections of 8×8 patches, a prepended learned `[CLS]` token, learned 1D position embeddings, six pre-norm transformer blocks, eight attention heads, 256-dimensional embeddings, and 1,024-dimensional MLPs. A LayerNorm and linear classification head use the final `[CLS]` representation. It has 4,856,776 parameters, 2.13% more than the CNN.

Both models train from scratch with the same augmentation, normalization, seed, and stratified 90,000/10,000 training/tuning split. The official 10,000-image validation set is held out for final evaluation. Each model searches three batch sizes × three learning rates for ten epochs per run, then trains three bootstrap models to estimate probability bias² and variance. These are empirical Brier-score estimates, rather than a decomposition of classification error.

The notebook saves `.pt` checkpoints, training times, reports, predictions, and Matplotlib charts under `src/output/cnn/` and `src/output/vit/`. Set `SKIP_TRAINING_IF_EXISTS = True` for the CNN and `VIT_SKIP_TRAINING_IF_EXISTS = True` for the ViT to reuse completed matching runs. The model-definition cells also provide loaders for inference without running the training cells.

## Comparisons

### Training Time

### Training & Validation Accuracy

### Bias

### Variance

### More?
class DeepAnt(nn.Module):
    def __init__(self, seq_len=12, out_dim=1):
        super().__init__()
        self.convblock1 = nn.Sequential(
            nn.Conv1d(in_channels=1, out_channels=32, kernel_size=3),
            nn.ReLU()
        )
        self.convblock2 = nn.Sequential(
            nn.Conv1d(in_channels=32, out_channels=32, kernel_size=3),
            nn.ReLU()
        )
        self.flatten = nn.Flatten()
        # Conv 결과물 크기 추론: seq_len=12 → (12-2)=10 → (10-2)=8
        # 채널 32 → Flatten 시 32*8=256

        self.fc = nn.Sequential(
            nn.Linear(in_features=256, out_features=80),
            nn.ReLU(),
            nn.Dropout(p=0.0),
            nn.Linear(in_features=80, out_features=out_dim)
        )



class AnomalyDetector(pl.LightningModule):
    def __init__(self, model, lr=1e-4):
        super().__init__()
        self.model = model
        self.criterion = nn.MSELoss()
        self.lr = lr
        ...
    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters(), lr=self.lr)

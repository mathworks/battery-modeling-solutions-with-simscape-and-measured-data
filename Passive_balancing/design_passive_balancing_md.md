# バッテリーパック充電時におけるパッシブバランス制御
# 目的


3S-1Pバッテリーパックの充電時にセル充電量のアンバランスを解消する制御を行う。


# 初期化

```matlab:Code
system_model_name = 'passive_balancing_system';
controller_model_name = 'balancing_controller';
```

# モデル


以下のコマンドを実行してモデルを開くこと。



```matlab:Code
open_system(system_model_name);
```



「battery_plant_model」サブシステムは制御対象のバッテリーパックである。ここではバッテリーの充電は簡単化し、一定の電流で充電するものとする。




「Controller」参照モデルは制御モデルであり、「balancing_controller.slx」を参照している。バッテリーからセルごとの電圧を計測し、各セルに対して放電するかどうかのフラグを出力している。




「balancing_controller.slx」にはテストハーネス「balancing_controller_harness」が付いており、制御モデル単体で動作検証を行うことができる。


# 実行、動作結果の確認


モデルを実行し、シミュレーションデータインスペクターで結果を確認する。一定の電流で充電する過程で、セルのアンバランスが解消されていることがわかる。



```matlab:Code
sim(system_model_name);
plot_passive_balansing_results_in_SDI;
```

# コード生成


制御モデル「balancing_controller.slx」は、Embedded Coder®によるCコード生成に対応している。以下のコマンドを実行し、モデルから生成されるCコードを確認すること。



```matlab:Code
open_system(controller_model_name);
slbuild(controller_model_name);
```

  


*Copyright 2022 The MathWorks, Inc.*




# 开发的时候，用到箭头函数，发现babel没有转换

问题的缘由是没有配置stage

```bash
npm install --save-dev babel-preset-stage-1
```

.babelrc
```
{
  "presets": ["es2015", "react", "stage-1"]
}
```

ref : [http://stackoverflow.com/questions/34939950/reactjs-material-ui-unexpected-token-on-arrow-functions]()
import React, { useState, useEffect, useCallback } from ‘react’;
import { Activity, Cpu, HardDrive, Wifi, Zap, Brain, Eye, Settings, TrendingUp, AlertTriangle, CheckCircle, Info } from ‘lucide-react’;

const PerformanceMonitoringDashboard = () => {
const [systemMetrics, setSystemMetrics] = useState({
cpu: { usage: 0, temperature: 0, cores: 8 },
memory: { used: 0, total: 8192, pressure: ‘Normal’ },
disk: { usage: 0, read: 0, write: 0 },
network: { download: 0, upload: 0, latency: 0 },
ai: { promptsProcessed: 0, averageResponseTime: 0, optimizationLevel: 0 },
neural: { patternRecognition: 0, cognitiveLoad: 0, learningRate: 0 }
});

const [alerts, setAlerts] = useState([]);
const [optimizations, setOptimizations] = useState([]);
const [isMonitoring, setIsMonitoring] = useState(true);
const [refreshRate, setRefreshRate] = useState(2000);

// Simulate real-time system metrics
useEffect(() => {
if (!isMonitoring) return;

```
const updateMetrics = () => {
  setSystemMetrics(prev => ({
    cpu: {
      usage: Math.max(5, Math.min(95, prev.cpu.usage + (Math.random() - 0.5) * 10)),
      temperature: Math.max(35, Math.min(85, prev.cpu.temperature + (Math.random() - 0.5) * 5)),
      cores: 8
    },
    memory: {
      used: Math.max(1000, Math.min(7500, prev.memory.used + (Math.random() - 0.5) * 200)),
      total: 8192,
      pressure: prev.memory.used > 6000 ? 'High' : prev.memory.used > 4000 ? 'Medium' : 'Normal'
    },
    disk: {
      usage: Math.max(45, Math.min(85, prev.disk.usage + (Math.random() - 0.5) * 5)),
      read: Math.max(0, prev.disk.read + (Math.random() - 0.5) * 50),
      write: Math.max(0, prev.disk.write + (Math.random() - 0.5) * 30)
    },
    network: {
      download: Math.max(0, prev.network.download + (Math.random() - 0.5) * 100),
      upload: Math.max(0, prev.network.upload + (Math.random() - 0.5) * 50),
      latency: Math.max(5, Math.min(100, prev.network.latency + (Math.random() - 0.5) * 10))
    },
    ai: {
      promptsProcessed: prev.ai.promptsProcessed + Math.floor(Math.random() * 3),
      averageResponseTime: Math.max(200, Math.min(3000, prev.ai.averageResponseTime + (Math.random() - 0.5) * 100)),
      optimizationLevel: Math.max(70, Math.min(100, prev.ai.optimizationLevel + (Math.random() - 0.5) * 2))
    },
    neural: {
      patternRecognition: Math.max(60, Math.min(100, prev.neural.patternRecognition + (Math.random() - 0.5) * 3)),
      cognitiveLoad: Math.max(10, Math.min(90, prev.neural.cognitiveLoad + (Math.random() - 0.5) * 5)),
      learningRate: Math.max(0.1, Math.min(2.0, prev.neural.learningRate + (Math.random() - 0.5) * 0.1))
    }
  }));
};

const interval = setInterval(updateMetrics, refreshRate);
return () => clearInterval(interval);
```

}, [isMonitoring, refreshRate]);

// Generate alerts based on system state
useEffect(() => {
const newAlerts = [];

```
if (systemMetrics.cpu.usage > 80) {
  newAlerts.push({
    id: 'cpu-high',
    type: 'warning',
    message: `High CPU usage: ${systemMetrics.cpu.usage.toFixed(1)}%`,
    action: 'Consider closing unnecessary applications'
  });
}

if (systemMetrics.cpu.temperature > 75) {
  newAlerts.push({
    id: 'temp-high',
    type: 'critical',
    message: `High CPU temperature: ${systemMetrics.cpu.temperature.toFixed(1)}°C`,
    action: 'Check thermal management'
  });
}

if (systemMetrics.memory.pressure === 'High') {
  newAlerts.push({
    id: 'memory-pressure',
    type: 'warning',
    message: 'High memory pressure detected',
    action: 'Run memory optimization'
  });
}

if (systemMetrics.network.latency > 50) {
  newAlerts.push({
    id: 'network-latency',
    type: 'info',
    message: `High network latency: ${systemMetrics.network.latency.toFixed(1)}ms`,
    action: 'Check network connection'
  });
}

setAlerts(newAlerts);
```

}, [systemMetrics]);

// Generate optimization suggestions
useEffect(() => {
const newOptimizations = [];

```
if (systemMetrics.ai.optimizationLevel < 90) {
  newOptimizations.push({
    id: 'ai-optimization',
    title: 'AI Performance Enhancement',
    description: 'Neural processing can be optimized further',
    impact: 'High',
    action: 'Run AI optimization protocol'
  });
}

if (systemMetrics.neural.cognitiveLoad > 70) {
  newOptimizations.push({
    id: 'cognitive-load',
    title: 'Cognitive Load Reduction',
    description: 'High cognitive load detected',
    impact: 'Medium',
    action: 'Distribute processing load'
  });
}

if (systemMetrics.disk.usage > 75) {
  newOptimizations.push({
    id: 'disk-cleanup',
    title: 'Disk Space Optimization',
    description: 'Low disk space may impact performance',
    impact: 'Medium',
    action: 'Clean temporary files and caches'
  });
}

setOptimizations(newOptimizations);
```

}, [systemMetrics]);

const MetricCard = ({ title, value, unit, icon: Icon, color, trend, subtitle }) => (
<div className={`bg-gradient-to-r ${color} p-6 rounded-lg text-white shadow-lg`}>
<div className="flex items-center justify-between">
<div>
<div className="text-sm opacity-90 font-medium">{title}</div>
<div className="text-3xl font-bold">{value}{unit}</div>
{subtitle && <div className="text-sm opacity-75 mt-1">{subtitle}</div>}
</div>
<div className="text-right">
<Icon className="w-8 h-8 opacity-80" />
{trend && (
<div className={`text-xs mt-2 flex items-center justify-end ${trend > 0 ? 'text-green-200' : 'text-red-200'}`}>
<TrendingUp className={`w-3 h-3 mr-1 ${trend < 0 ? 'rotate-180' : ''}`} />
{Math.abs(trend).toFixed(1)}%
</div>
)}
</div>
</div>
<div className="mt-4 bg-white bg-opacity-20 rounded-full h-2">
<div
className=“bg-white rounded-full h-2 transition-all duration-1000”
style={{ width: `${Math.min(100, (value / (unit === '%' ? 100 : value * 2)) * 100)}%` }}
/>
</div>
</div>
);

const AlertCard = ({ alert }) => {
const getAlertColor = (type) => {
switch (type) {
case ‘critical’: return ‘from-red-600 to-red-800’;
case ‘warning’: return ‘from-yellow-600 to-yellow-800’;
case ‘info’: return ‘from-blue-600 to-blue-800’;
default: return ‘from-gray-600 to-gray-800’;
}
};

```
const getAlertIcon = (type) => {
  switch (type) {
    case 'critical': return AlertTriangle;
    case 'warning': return AlertTriangle;
    case 'info': return Info;
    default: return CheckCircle;
  }
};

const AlertIcon = getAlertIcon(alert.type);

return (
  <div className={`bg-gradient-to-r ${getAlertColor(alert.type)} p-4 rounded-lg text-white mb-3`}>
    <div className="flex items-start">
      <AlertIcon className="w-5 h-5 mr-3 mt-0.5 flex-shrink-0" />
      <div className="flex-1">
        <div className="font-semibold">{alert.message}</div>
        <div className="text-sm opacity-80 mt-1">{alert.action}</div>
      </div>
    </div>
  </div>
);
```

};

const OptimizationCard = ({ optimization }) => (
<div className="bg-gray-800 bg-opacity-50 p-4 rounded-lg border border-gray-600 mb-3">
<div className="flex items-start justify-between">
<div className="flex-1">
<div className="font-semibold text-white">{optimization.title}</div>
<div className="text-sm text-gray-300 mt-1">{optimization.description}</div>
<div className="text-xs text-gray-400 mt-2">{optimization.action}</div>
</div>
<div className={`px-2 py-1 rounded text-xs font-medium ${ optimization.impact === 'High' ? 'bg-red-600 text-white' : optimization.impact === 'Medium' ? 'bg-yellow-600 text-white' : 'bg-green-600 text-white' }`}>
{optimization.impact}
</div>
</div>
</div>
);

return (
<div className="min-h-screen bg-gradient-to-br from-gray-900 via-purple-900 to-black text-white p-6">
<div className="max-w-7xl mx-auto">
{/* Header */}
<div className="flex items-center justify-between mb-8">
<div>
<h1 className="text-4xl font-bold bg-gradient-to-r from-cyan-400 via-blue-400 to-purple-400 bg-clip-text text-transparent">
📊 Performance Monitor
</h1>
<p className="text-gray-300 mt-2">Real-time system optimization and AI performance tracking</p>
</div>

```
      <div className="flex items-center space-x-4">
        <div className="flex items-center space-x-2">
          <span className="text-sm text-gray-300">Refresh Rate:</span>
          <select 
            value={refreshRate} 
            onChange={(e) => setRefreshRate(Number(e.target.value))}
            className="bg-gray-800 border border-gray-600 rounded px-2 py-1 text-white text-sm"
          >
            <option value={1000}>1s</option>
            <option value={2000}>2s</option>
            <option value={5000}>5s</option>
          </select>
        </div>
        
        <button
          onClick={() => setIsMonitoring(!isMonitoring)}
          className={`px-4 py-2 rounded font-medium transition-colors ${
            isMonitoring 
              ? 'bg-red-600 hover:bg-red-700 text-white' 
              : 'bg-green-600 hover:bg-green-700 text-white'
          }`}
        >
          {isMonitoring ? 'Pause' : 'Resume'}
        </button>
      </div>
    </div>

    {/* Main Metrics Grid */}
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 mb-8">
      <MetricCard
        title="CPU Usage"
        value={systemMetrics.cpu.usage.toFixed(1)}
        unit="%"
        icon={Cpu}
        color="from-blue-600 to-blue-800"
        subtitle={`${systemMetrics.cpu.temperature.toFixed(1)}°C`}
      />
      
      <MetricCard
        title="Memory"
        value={((systemMetrics.memory.used / systemMetrics.memory.total) * 100).toFixed(1)}
        unit="%"
        icon={HardDrive}
        color="from-green-600 to-green-800"
        subtitle={`${(systemMetrics.memory.used / 1024).toFixed(1)}GB / ${(systemMetrics.memory.total / 1024).toFixed(1)}GB`}
      />
      
      <MetricCard
        title="Disk Usage"
        value={systemMetrics.disk.usage.toFixed(1)}
        unit="%"
        icon={HardDrive}
        color="from-purple-600 to-purple-800"
        subtitle={`R: ${systemMetrics.disk.read.toFixed(0)}MB/s W: ${systemMetrics.disk.write.toFixed(0)}MB/s`}
      />
      
      <MetricCard
        title="Network"
        value={systemMetrics.network.latency.toFixed(0)}
        unit="ms"
        icon={Wifi}
        color="from-orange-600 to-orange-800"
        subtitle={`↓${systemMetrics.network.download.toFixed(0)}MB/s ↑${systemMetrics.network.upload.toFixed(0)}MB/s`}
      />
    </div>

    {/* AI Performance Metrics */}
    <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
      <MetricCard
        title="AI Optimization"
        value={systemMetrics.ai.optimizationLevel.toFixed(1)}
        unit="%"
        icon={Brain}
        color="from-cyan-600 to-cyan-800"
        subtitle={`${systemMetrics.ai.promptsProcessed} prompts processed`}
      />
      
      <MetricCard
        title="Response Time"
        value={systemMetrics.ai.averageResponseTime.toFixed(0)}
        unit="ms"
        icon={Zap}
        color="from-pink-600 to-pink-800"
        subtitle="Average AI response time"
      />
      
      <MetricCard
        title="Neural Activity"
        value={systemMetrics.neural.patternRecognition.toFixed(1)}
        unit="%"
        icon={Activity}
        color="from-indigo-600 to-indigo-800"
        subtitle={`Learning rate: ${systemMetrics.neural.learningRate.toFixed(2)}`}
      />
    </div>

    {/* Alerts and Optimizations */}
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
      {/* System Alerts */}
      <div>
        <div className="flex items-center mb-6">
          <AlertTriangle className="w-6 h-6 mr-2 text-yellow-400" />
          <h2 className="text-2xl font-bold">System Alerts</h2>
          <span className="ml-3 px-2 py-1 bg-yellow-600 text-white rounded text-sm">
            {alerts.length}
          </span>
        </div>
        
        <div className="space-y-3">
          {alerts.length > 0 ? (
            alerts.map(alert => (
              <AlertCard key={alert.id} alert={alert} />
            ))
          ) : (
            <div className="bg-green-600 bg-opacity-20 border border-green-500 p-4 rounded-lg text-green-300">
              <div className="flex items-center">
                <CheckCircle className="w-5 h-5 mr-2" />
                All systems operating normally
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Optimization Recommendations */}
      <div>
        <div className="flex items-center mb-6">
          <Settings className="w-6 h-6 mr-2 text-blue-400" />
          <h2 className="text-2xl font-bold">Optimizations</h2>
          <span className="ml-3 px-2 py-1 bg-blue-600 text-white rounded text-sm">
            {optimizations.length}
          </span>
        </div>
        
        <div className="space-y-3">
          {optimizations.length > 0 ? (
            optimizations.map(optimization => (
              <OptimizationCard key={optimization.id} optimization={optimization} />
            ))
          ) : (
            <div className="bg-blue-600 bg-opacity-20 border border-blue-500 p-4 rounded-lg text-blue-300">
              <div className="flex items-center">
                <CheckCircle className="w-5 h-5 mr-2" />
                System fully optimized
              </div>
            </div>
          )}
        </div>
      </div>
    </div>

    {/* Real-time Charts Section */}
    <div className="mt-8">
      <h2 className="text-2xl font-bold mb-6 flex items-center">
        <Eye className="w-6 h-6 mr-2 text-purple-400" />
        Live Performance Charts
      </h2>
      
      <div className="bg-gray-800 bg-opacity-50 rounded-lg p-6 border border-gray-600">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* CPU & Memory Chart */}
          <div>
            <h3 className="text-lg font-semibold mb-4 text-cyan-400">System Resources</h3>
            <div className="space-y-3">
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>CPU Usage</span>
                  <span>{systemMetrics.cpu.usage.toFixed(1)}%</span>
                </div>
                <div className="bg-gray-700 rounded-full h-3">
                  <div 
                    className="bg-gradient-to-r from-blue-500 to-cyan-500 rounded-full h-3 transition-all duration-1000"
                    style={{ width: `${systemMetrics.cpu.usage}%` }}
                  />
                </div>
              </div>
              
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Memory Usage</span>
                  <span>{((systemMetrics.memory.used / systemMetrics.memory.total) * 100).toFixed(1)}%</span>
                </div>
                <div className="bg-gray-700 rounded-full h-3">
                  <div 
                    className="bg-gradient-to-r from-green-500 to-emerald-500 rounded-full h-3 transition-all duration-1000"
                    style={{ width: `${(systemMetrics.memory.used / systemMetrics.memory.total) * 100}%` }}
                  />
                </div>
              </div>
              
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Disk Usage</span>
                  <span>{systemMetrics.disk.usage.toFixed(1)}%</span>
                </div>
                <div className="bg-gray-700 rounded-full h-3">
                  <div 
                    className="bg-gradient-to-r from-purple-500 to-pink-500 rounded-full h-3 transition-all duration-1000"
                    style={{ width: `${systemMetrics.disk.usage}%` }}
                  />
                </div>
              </div>
            </div>
          </div>

          {/* AI Performance Chart */}
          <div>
            <h3 className="text-lg font-semibold mb-4 text-pink-400">AI Performance</h3>
            <div className="space-y-3">
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Optimization Level</span>
                  <span>{systemMetrics.ai.optimizationLevel.toFixed(1)}%</span>
                </div>
                <div className="bg-gray-700 rounded-full h-3">
                  <div 
                    className="bg-gradient-to-r from-cyan-500 to-blue-500 rounded-full h-3 transition-all duration-1000"
                    style={{ width: `${systemMetrics.ai.optimizationLevel}%` }}
                  />
                </div>
              </div>
              
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Pattern Recognition</span>
                  <span>{systemMetrics.neural.patternRecognition.toFixed(1)}%</span>
                </div>
                <div className="bg-gray-700 rounded-full h-3">
                  <div 
                    className="bg-gradient-to-r from-indigo-500 to-purple-500 rounded-full h-3 transition-all duration-1000"
                    style={{ width: `${systemMetrics.neural.patternRecognition}%` }}
                  />
                </div>
              </div>
              
              <div>
                <div className="flex justify-between text-sm mb-1">
                  <span>Cognitive Load</span>
                  <span>{systemMetrics.neural.cognitiveLoad.toFixed(1)}%</span>
                </div>
                <div className="bg-gray-700 rounded-full h-3">
                  <div 
                    className={`rounded-full h-3 transition-all duration-1000 ${
                      systemMetrics.neural.cognitiveLoad > 70 
                        ? 'bg-gradient-to-r from-red-500 to-orange-500' 
                        : 'bg-gradient-to-r from-yellow-500 to-green-500'
                    }`}
                    style={{ width: `${systemMetrics.neural.cognitiveLoad}%` }}
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    {/* Footer Status */}
    <div className="mt-8 text-center">
      <div className="inline-flex items-center px-6 py-3 bg-gradient-to-r from-green-600 to-emerald-600 rounded-lg">
        <CheckCircle className="w-5 h-5 mr-2" />
        <span className="font-semibold">HyperMind Monitoring Active</span>
        <span className="ml-3 text-sm opacity-75">
          Last updated: {new Date().toLocaleTimeString()}
        </span>
      </div>
    </div>
  </div>
</div>
```

);
};

export default PerformanceMonitoringDashboard;
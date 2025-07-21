// Advanced settings and configurations

import React, { useState, useEffect } from ‘react’;
import {
Settings, Save, RotateCcw, Download, Upload, Monitor, Cpu,
Brain, Zap, Shield, Network, HardDrive, Palette, Volume2,
Bell, Eye, Code, Database, Wifi, Thermometer, Activity
} from ‘lucide-react’;

const AdvancedSettingsPanel = () => {
const [settings, setSettings] = useState({
// System Optimization Settings
system: {
autoOptimization: true,
aggressiveMode: false,
thermalManagement: true,
memoryOptimization: true,
cpuPrioritization: true,
networkOptimization: true,
diskOptimization: true,
spotlightIndexing: false,
backgroundAppTermination: true,
ramDiskSize: 2048, // MB
maxCpuUsage: 80,
maxMemoryUsage: 85,
maxTemperature: 85
},

```
// AI Processing Settings
ai: {
  model: 'claude-sonnet-4-20250514',
  maxTokens: 4000,
  temperature: 0.1,
  cognitiveMode: 'neural_dominance',
  enhancementLevel: 'maximum',
  adaptiveLearning: true,
  patternRecognition: true,
  contextCaching: true,
  responseStreaming: false,
  retryAttempts: 3,
  timeoutMs: 30000,
  batchProcessing: true,
  performanceLogging: true
},

// Interface Settings
interface: {
  theme: 'dark',
  animations: true,
  soundEffects: false,
  notifications: true,
  autoRefresh: true,
  refreshRate: 2000,
  fontSize: 'medium',
  colorScheme: 'purple',
  compactMode: false,
  showAdvancedMetrics: true,
  realTimeCharts: true,
  glassMorphism: true
},

// Monitoring Settings
monitoring: {
  enabled: true,
  realTimeAlerts: true,
  performanceLogging: true,
  systemMetrics: true,
  aiMetrics: true,
  networkMetrics: true,
  alertThresholds: {
    cpu: 85,
    memory: 90,
    temperature: 80,
    disk: 85,
    network: 100
  },
  logRetention: 7, // days
  exportFormat: 'json'
},

// Security Settings
security: {
  encryptData: true,
  secureStorage: true,
  anonymizeMetrics: true,
  localProcessingOnly: true,
  auditLogging: true,
  dataRetention: 30, // days
  automaticCleanup: true
},

// Developer Settings
developer: {
  debugMode: false,
  verboseLogging: false,
  apiLogging: false,
  performanceProfiling: false,
  experimentalFeatures: false,
  customPromptTemplates: false,
  advancedMetrics: false,
  systemDiagnostics: false
}
```

});

const [activeTab, setActiveTab] = useState(‘system’);
const [hasChanges, setHasChanges] = useState(false);
const [lastSaved, setLastSaved] = useState(null);

// Load settings from localStorage on component mount
useEffect(() => {
const savedSettings = localStorage.getItem(‘hypermind_settings’);
if (savedSettings) {
try {
const parsed = JSON.parse(savedSettings);
setSettings(prev => ({ …prev, …parsed }));
} catch (error) {
console.error(‘Failed to load saved settings:’, error);
}
}
}, []);

// Track changes
useEffect(() => {
setHasChanges(true);
}, [settings]);

const updateSetting = (category, key, value) => {
setSettings(prev => ({
…prev,
[category]: {
…prev[category],
[key]: value
}
}));
};

const updateNestedSetting = (category, nestedKey, key, value) => {
setSettings(prev => ({
…prev,
[category]: {
…prev[category],
[nestedKey]: {
…prev[category][nestedKey],
[key]: value
}
}
}));
};

const saveSettings = () => {
try {
localStorage.setItem(‘hypermind_settings’, JSON.stringify(settings));
setHasChanges(false);
setLastSaved(new Date().toLocaleTimeString());

```
  // Simulate applying settings to system
  console.log('Settings saved and applied:', settings);
} catch (error) {
  console.error('Failed to save settings:', error);
}
```

};

const resetSettings = () => {
if (window.confirm(‘Are you sure you want to reset all settings to defaults?’)) {
localStorage.removeItem(‘hypermind_settings’);
window.location.reload();
}
};

const exportSettings = () => {
const dataStr = JSON.stringify(settings, null, 2);
const dataBlob = new Blob([dataStr], { type: ‘application/json’ });
const url = URL.createObjectURL(dataBlob);
const link = document.createElement(‘a’);
link.href = url;
link.download = `hypermind_settings_${new Date().toISOString().split('T')[0]}.json`;
link.click();
URL.revokeObjectURL(url);
};

const importSettings = (event) => {
const file = event.target.files[0];
if (file) {
const reader = new FileReader();
reader.onload = (e) => {
try {
const importedSettings = JSON.parse(e.target.result);
setSettings(prev => ({ …prev, …importedSettings }));
setHasChanges(true);
} catch (error) {
alert(‘Invalid settings file format’);
}
};
reader.readAsText(file);
}
};

const ToggleSwitch = ({ enabled, onChange, label, description }) => (
<div className="flex items-center justify-between p-4 bg-gray-800 bg-opacity-50 rounded-lg">
<div className="flex-1">
<div className="font-medium text-white">{label}</div>
{description && <div className="text-sm text-gray-400 mt-1">{description}</div>}
</div>
<button
onClick={() => onChange(!enabled)}
className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${ enabled ? 'bg-blue-600' : 'bg-gray-600' }`}
>
<span
className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${ enabled ? 'translate-x-6' : 'translate-x-1' }`}
/>
</button>
</div>
);

const SliderInput = ({ value, onChange, min, max, step = 1, label, unit = ‘’, description }) => (
<div className="p-4 bg-gray-800 bg-opacity-50 rounded-lg">
<div className="flex justify-between items-center mb-3">
<div>
<div className="font-medium text-white">{label}</div>
{description && <div className="text-sm text-gray-400 mt-1">{description}</div>}
</div>
<div className="text-lg font-bold text-blue-400">{value}{unit}</div>
</div>
<input
type=“range”
min={min}
max={max}
step={step}
value={value}
onChange={(e) => onChange(Number(e.target.value))}
className=“w-full h-2 bg-gray-700 rounded-lg appearance-none cursor-pointer slider”
/>
<div className="flex justify-between text-xs text-gray-400 mt-1">
<span>{min}{unit}</span>
<span>{max}{unit}</span>
</div>
</div>
);

const SelectInput = ({ value, onChange, options, label, description }) => (
<div className="p-4 bg-gray-800 bg-opacity-50 rounded-lg">
<div className="mb-3">
<div className="font-medium text-white">{label}</div>
{description && <div className="text-sm text-gray-400 mt-1">{description}</div>}
</div>
<select
value={value}
onChange={(e) => onChange(e.target.value)}
className=“w-full bg-gray-700 border border-gray-600 rounded px-3 py-2 text-white focus:border-blue-500 focus:outline-none”
>
{options.map(option => (
<option key={option.value} value={option.value}>{option.label}</option>
))}
</select>
</div>
);

const tabs = [
{ id: ‘system’, label: ‘System’, icon: Cpu },
{ id: ‘ai’, label: ‘AI Engine’, icon: Brain },
{ id: ‘interface’, label: ‘Interface’, icon: Palette },
{ id: ‘monitoring’, label: ‘Monitoring’, icon: Activity },
{ id: ‘security’, label: ‘Security’, icon: Shield },
{ id: ‘developer’, label: ‘Developer’, icon: Code }
];

const renderSystemSettings = () => (
<div className="space-y-4">
<h3 className="text-xl font-bold text-cyan-400 mb-6 flex items-center">
<Cpu className="w-5 h-5 mr-2" />
System Optimization
</h3>

```
  <ToggleSwitch
    enabled={settings.system.autoOptimization}
    onChange={(value) => updateSetting('system', 'autoOptimization', value)}
    label="Auto Optimization"
    description="Automatically optimize system performance in real-time"
  />
  
  <ToggleSwitch
    enabled={settings.system.aggressiveMode}
    onChange={(value) => updateSetting('system', 'aggressiveMode', value)}
    label="Aggressive Mode"
    description="Maximum performance optimization (may impact system stability)"
  />
  
  <ToggleSwitch
    enabled={settings.system.thermalManagement}
    onChange={(value) => updateSetting('system', 'thermalManagement', value)}
    label="Thermal Management"
    description="Intelligent thermal throttling and fan control"
  />
  
  <ToggleSwitch
    enabled={settings.system.memoryOptimization}
    onChange={(value) => updateSetting('system', 'memoryOptimization', value)}
    label="Memory Optimization"
    description="Automatic memory cleanup and optimization"
  />
  
  <ToggleSwitch
    enabled={settings.system.spotlightIndexing}
    onChange={(value) => updateSetting('system', 'spotlightIndexing', value)}
    label="Spotlight Indexing"
    description="Enable/disable Spotlight indexing (disabling improves performance)"
  />
  
  <SliderInput
    value={settings.system.ramDiskSize}
    onChange={(value) => updateSetting('system', 'ramDiskSize', value)}
    min={512}
    max={4096}
    step={256}
    label="RAM Disk Size"
    unit="MB"
    description="Size of high-speed RAM disk for temporary files"
  />
  
  <SliderInput
    value={settings.system.maxCpuUsage}
    onChange={(value) => updateSetting('system', 'maxCpuUsage', value)}
    min={50}
    max={100}
    label="Maximum CPU Usage"
    unit="%"
    description="Alert threshold for CPU usage"
  />
  
  <SliderInput
    value={settings.system.maxTemperature}
    onChange={(value) => updateSetting('system', 'maxTemperature', value)}
    min={60}
    max={100}
    label="Maximum Temperature"
    unit="°C"
    description="Alert threshold for CPU temperature"
  />
</div>
```

);

const renderAISettings = () => (
<div className="space-y-4">
<h3 className="text-xl font-bold text-pink-400 mb-6 flex items-center">
<Brain className="w-5 h-5 mr-2" />
AI Engine Configuration
</h3>

```
  <SelectInput
    value={settings.ai.model}
    onChange={(value) => updateSetting('ai', 'model', value)}
    label="AI Model"
    description="Select the AI model for processing"
    options={[
      { value: 'claude-sonnet-4-20250514', label: 'Claude Sonnet 4' },
      { value: 'claude-opus-4', label: 'Claude Opus 4' },
      { value: 'gpt-4', label: 'GPT-4' },
      { value: 'custom', label: 'Custom Model' }
    ]}
  />
  
  <SelectInput
    value={settings.ai.cognitiveMode}
    onChange={(value) => updateSetting('ai', 'cognitiveMode', value)}
    label="Cognitive Mode"
    description="Primary thinking pattern for AI processing"
    options={[
      { value: 'neural_dominance', label: 'Neural Dominance' },
      { value: 'tactical_execution', label: 'Tactical Execution' },
      { value: 'quantum_breakthrough', label: 'Quantum Breakthrough' },
      { value: 'meta_synthesis', label: 'Meta Synthesis' },
      { value: 'recursive_optimization', label: 'Recursive Optimization' }
    ]}
  />
  
  <SelectInput
    value={settings.ai.enhancementLevel}
    onChange={(value) => updateSetting('ai', 'enhancementLevel', value)}
    label="Enhancement Level"
    description="Level of cognitive enhancement to apply"
    options={[
      { value: 'maximum', label: 'Maximum Performance' },
      { value: 'high', label: 'High Performance' },
      { value: 'balanced', label: 'Balanced' },
      { value: 'conservative', label: 'Conservative' }
    ]}
  />
  
  <SliderInput
    value={settings.ai.maxTokens}
    onChange={(value) => updateSetting('ai', 'maxTokens', value)}
    min={1000}
    max={8000}
    step={500}
    label="Maximum Tokens"
    description="Maximum response length for AI processing"
  />
  
  <SliderInput
    value={settings.ai.temperature}
    onChange={(value) => updateSetting('ai', 'temperature', value)}
    min={0}
    max={1}
    step={0.1}
    label="Temperature"
    description="Creativity vs precision balance (0 = precise, 1 = creative)"
  />
  
  <SliderInput
    value={settings.ai.timeoutMs}
    onChange={(value) => updateSetting('ai', 'timeoutMs', value)}
    min={10000}
    max={60000}
    step={5000}
    label="Request Timeout"
    unit="ms"
    description="Maximum time to wait for AI responses"
  />
  
  <ToggleSwitch
    enabled={settings.ai.adaptiveLearning}
    onChange={(value) => updateSetting('ai', 'adaptiveLearning', value)}
    label="Adaptive Learning"
    description="Allow AI to learn and adapt from interactions"
  />
  
  <ToggleSwitch
    enabled={settings.ai.contextCaching}
    onChange={(value) => updateSetting('ai', 'contextCaching', value)}
    label="Context Caching"
    description="Cache conversation context for improved performance"
  />
  
  <ToggleSwitch
    enabled={settings.ai.batchProcessing}
    onChange={(value) => updateSetting('ai', 'batchProcessing', value)}
    label="Batch Processing"
    description="Process multiple requests efficiently in batches"
  />
</div>
```

);

const renderInterfaceSettings = () => (
<div className="space-y-4">
<h3 className="text-xl font-bold text-purple-400 mb-6 flex items-center">
<Palette className="w-5 h-5 mr-2" />
Interface Customization
</h3>

```
  <SelectInput
    value={settings.interface.theme}
    onChange={(value) => updateSetting('interface', 'theme', value)}
    label="Theme"
    description="Overall visual theme"
    options={[
      { value: 'dark', label: 'Dark Mode' },
      { value: 'light', label: 'Light Mode' },
      { value: 'auto', label: 'Auto (System)' },
      { value: 'midnight', label: 'Midnight Blue' }
    ]}
  />
  
  <SelectInput
    value={settings.interface.colorScheme}
    onChange={(value) => updateSetting('interface', 'colorScheme', value)}
    label="Color Scheme"
    description="Primary color palette"
    options={[
      { value: 'purple', label: 'Purple Gradient' },
      { value: 'blue', label: 'Blue Gradient' },
      { value: 'green', label: 'Green Gradient' },
      { value: 'orange', label: 'Orange Gradient' },
      { value: 'red', label: 'Red Gradient' },
      { value: 'rainbow', label: 'Rainbow' }
    ]}
  />
  
  <SelectInput
    value={settings.interface.fontSize}
    onChange={(value) => updateSetting('interface', 'fontSize', value)}
    label="Font Size"
    description="Base font size for the interface"
    options={[
      { value: 'small', label: 'Small' },
      { value: 'medium', label: 'Medium' },
      { value: 'large', label: 'Large' },
      { value: 'extra-large', label: 'Extra Large' }
    ]}
  />
  
  <SliderInput
    value={settings.interface.refreshRate}
    onChange={(value) => updateSetting('interface', 'refreshRate', value)}
    min={1000}
    max={10000}
    step={500}
    label="Refresh Rate"
    unit="ms"
    description="How often the interface updates data"
  />
  
  <ToggleSwitch
    enabled={settings.interface.animations}
    onChange={(value) => updateSetting('interface', 'animations', value)}
    label="Animations"
    description="Enable smooth animations and transitions"
  />
  
  <ToggleSwitch
    enabled={settings.interface.soundEffects}
    onChange={(value) => updateSetting('interface', 'soundEffects', value)}
    label="Sound Effects"
    description="Play sounds for interactions and notifications"
  />
  
  <ToggleSwitch
    enabled={settings.interface.notifications}
    onChange={(value) => updateSetting('interface', 'notifications', value)}
    label="Notifications"
    description="Show system and performance notifications"
  />
  
  <ToggleSwitch
    enabled={settings.interface.glassMorphism}
    onChange={(value) => updateSetting('interface', 'glassMorphism', value)}
    label="Glass Morphism"
    description="Apply glass-like transparency effects"
  />
  
  <ToggleSwitch
    enabled={settings.interface.realTimeCharts}
    onChange={(value) => updateSetting('interface', 'realTimeCharts', value)}
    label="Real-time Charts"
    description="Show live performance charts"
  />
  
  <ToggleSwitch
    enabled={settings.interface.compactMode}
    onChange={(value) => updateSetting('interface', 'compactMode', value)}
    label="Compact Mode"
    description="Reduce spacing and show more information"
  />
</div>
```

);

const renderMonitoringSettings = () => (
<div className="space-y-4">
<h3 className="text-xl font-bold text-green-400 mb-6 flex items-center">
<Activity className="w-5 h-5 mr-2" />
Performance Monitoring
</h3>

```
  <ToggleSwitch
    enabled={settings.monitoring.enabled}
    onChange={(value) => updateSetting('monitoring', 'enabled', value)}
    label="Performance Monitoring"
    description="Enable comprehensive system monitoring"
  />
  
  <ToggleSwitch
    enabled={settings.monitoring.realTimeAlerts}
    onChange={(value) => updateSetting('monitoring', 'realTimeAlerts', value)}
    label="Real-time Alerts"
    description="Show immediate alerts for performance issues"
  />
  
  <ToggleSwitch
    enabled={settings.monitoring.performanceLogging}
    onChange={(value) => updateSetting('monitoring', 'performanceLogging', value)}
    label="Performance Logging"
    description="Log detailed performance metrics"
  />
  
  <SliderInput
    value={settings.monitoring.alertThresholds.cpu}
    onChange={(value) => updateNestedSetting('monitoring', 'alertThresholds', 'cpu', value)}
    min={50}
    max={100}
    label="CPU Alert Threshold"
    unit="%"
    description="Trigger alerts when CPU usage exceeds this level"
  />
  
  <SliderInput
    value={settings.monitoring.alertThresholds.memory}
    onChange={(value) => updateNestedSetting('monitoring', 'alertThresholds', 'memory', value)}
    min={50}
    max={100}
    label="Memory Alert Threshold"
    unit="%"
    description="Trigger alerts when memory usage exceeds this level"
  />
  
  <SliderInput
    value={settings.monitoring.alertThresholds.temperature}
    onChange={(value) => updateNestedSetting('monitoring', 'alertThresholds', 'temperature', value)}
    min={60}
    max={100}
    label="Temperature Alert Threshold"
    unit="°C"
    description="Trigger alerts when temperature exceeds this level"
  />
  
  <SliderInput
    value={settings.monitoring.logRetention}
    onChange={(value) => updateSetting('monitoring', 'logRetention', value)}
    min={1}
    max={30}
    label="Log Retention"
    unit=" days"
    description="How long to keep performance logs"
  />
  
  <SelectInput
    value={settings.monitoring.exportFormat}
    onChange={(value) => updateSetting('monitoring', 'exportFormat', value)}
    label="Export Format"
    description="Format for exporting monitoring data"
    options={[
      { value: 'json', label: 'JSON' },
      { value: 'csv', label: 'CSV' },
      { value: 'xml', label: 'XML' },
      { value: 'excel', label: 'Excel' }
    ]}
  />
</div>
```

);

const renderSecuritySettings = () => (
<div className="space-y-4">
<h3 className="text-xl font-bold text-red-400 mb-6 flex items-center">
<Shield className="w-5 h-5 mr-2" />
Security & Privacy
</h3>

```
  <ToggleSwitch
    enabled={settings.security.encryptData}
    onChange={(value) => updateSetting('security', 'encryptData', value)}
    label="Encrypt Data"
    description="Encrypt all stored data and communications"
  />
  
  <ToggleSwitch
    enabled={settings.security.secureStorage}
    onChange={(value) => updateSetting('security', 'secureStorage', value)}
    label="Secure Storage"
    description="Use encrypted storage for sensitive information"
  />
  
  <ToggleSwitch
    enabled={settings.security.anonymizeMetrics}
    onChange={(value) => updateSetting('security', 'anonymizeMetrics', value)}
    label="Anonymize Metrics"
    description="Remove personally identifiable information from metrics"
  />
  
  <ToggleSwitch
    enabled={settings.security.localProcessingOnly}
    onChange={(value) => updateSetting('security', 'localProcessingOnly', value)}
    label="Local Processing Only"
    description="Process all data locally without external connections"
  />
  
  <ToggleSwitch
    enabled={settings.security.auditLogging}
    onChange={(value) => updateSetting('security', 'auditLogging', value)}
    label="Audit Logging"
    description="Log all security-related events and access"
  />
  
  <SliderInput
    value={settings.security.dataRetention}
    onChange={(value) => updateSetting('security', 'dataRetention', value)}
    min={1}
    max={365}
    label="Data Retention"
    unit=" days"
    description="How long to keep user data and logs"
  />
  
  <ToggleSwitch
    enabled={settings.security.automaticCleanup}
    onChange={(value) => updateSetting('security', 'automaticCleanup', value)}
    label="Automatic Cleanup"
    description="Automatically delete old data and temporary files"
  />
</div>
```

);

const renderDeveloperSettings = () => (
<div className="space-y-4">
<h3 className="text-xl font-bold text-yellow-400 mb-6 flex items-center">
<Code className="w-5 h-5 mr-2" />
Developer Options
</h3>

```
  <ToggleSwitch
    enabled={settings.developer.debugMode}
    onChange={(value) => updateSetting('developer', 'debugMode', value)}
    label="Debug Mode"
    description="Enable detailed debugging information"
  />
  
  <ToggleSwitch
    enabled={settings.developer.verboseLogging}
    onChange={(value) => updateSetting('developer', 'verboseLogging', value)}
    label="Verbose Logging"
    description="Log detailed operational information"
  />
  
  <ToggleSwitch
    enabled={settings.developer.apiLogging}
    onChange={(value) => updateSetting('developer', 'apiLogging', value)}
    label="API Logging"
    description="Log all API requests and responses"
  />
  
  <ToggleSwitch
    enabled={settings.developer.performanceProfiling}
    onChange={(value) => updateSetting('developer', 'performanceProfiling', value)}
    label="Performance Profiling"
    description="Enable detailed performance profiling"
  />
  
  <ToggleSwitch
    enabled={settings.developer.experimentalFeatures}
    onChange={(value) => updateSetting('developer', 'experimentalFeatures', value)}
    label="Experimental Features"
    description="Enable experimental and beta features"
  />
  
  <ToggleSwitch
    enabled={settings.developer.customPromptTemplates}
    onChange={(value) => updateSetting('developer', 'customPromptTemplates', value)}
    label="Custom Prompt Templates"
    description="Allow custom AI prompt template creation"
  />
  
  <ToggleSwitch
    enabled={settings.developer.systemDiagnostics}
    onChange={(value) => updateSetting('developer', 'systemDiagnostics', value)}
    label="System Diagnostics"
    description="Enable advanced system diagnostic tools"
  />
</div>
```

);

const renderTabContent = () => {
switch (activeTab) {
case ‘system’: return renderSystemSettings();
case ‘ai’: return renderAISettings();
case ‘interface’: return renderInterfaceSettings();
case ‘monitoring’: return renderMonitoringSettings();
case ‘security’: return renderSecuritySettings();
case ‘developer’: return renderDeveloperSettings();
default: return renderSystemSettings();
}
};

return (
<div className="min-h-screen bg-gradient-to-br from-gray-900 via-purple-900 to-black text-white p-6">
<div className="max-w-6xl mx-auto">
{/* Header */}
<div className="flex items-center justify-between mb-8">
<div>
<h1 className="text-4xl font-bold bg-gradient-to-r from-cyan-400 via-blue-400 to-purple-400 bg-clip-text text-transparent flex items-center">
<Settings className="w-10 h-10 mr-3 text-cyan-400" />
Advanced Settings
</h1>
<p className="text-gray-300 mt-2">Configure HyperMind for optimal performance</p>
</div>

```
      <div className="flex items-center space-x-3">
        <input
          type="file"
          accept=".json"
          onChange={importSettings}
          className="hidden"
          id="import-settings"
        />
        <label
          htmlFor="import-settings"
          className="px-4 py-2 bg-blue-600 hover:bg-blue-700 rounded font-medium cursor-pointer transition-colors flex items-center"
        >
          <Upload className="w-4 h-4 mr-2" />
          Import
        </label>
        
        <button
          onClick={exportSettings}
          className="px-4 py-2 bg-green-600 hover:bg-green-700 rounded font-medium transition-colors flex items-center"
        >
          <Download className="w-4 h-4 mr-2" />
          Export
        </button>
        
        <button
          onClick={resetSettings}
          className="px-4 py-2 bg-red-600 hover:bg-red-700 rounded font-medium transition-colors flex items-center"
        >
          <RotateCcw className="w-4 h-4 mr-2" />
          Reset
        </button>
        
        <button
          onClick={saveSettings}
          disabled={!hasChanges}
          className={`px-6 py-2 rounded font-bold transition-colors flex items-center ${
            hasChanges 
              ? 'bg-purple-600 hover:bg-purple-700 text-white' 
              : 'bg-gray-600 text-gray-400 cursor-not-allowed'
          }`}
        >
          <Save className="w-4 h-4 mr-2" />
          Save Settings
        </button>
      </div>
    </div>

    {/* Save Status */}
    {lastSaved && (
      <div className="mb-6 p-3 bg-green-600 bg-opacity-20 border border-green-500 rounded-lg text-green-300">
        Settings saved successfully at {lastSaved}
      </div>
    )}

    {/* Tab Navigation */}
    <div className="flex flex-wrap gap-2 mb-8">
      {tabs.map(tab => {
        const Icon = tab.icon;
        return (
          <button
            key={tab.id}
            onClick={() => setActiveTab(tab.id)}
            className={`px-6 py-3 rounded-lg font-medium transition-all flex items-center ${
              activeTab === tab.id
                ? 'bg-gradient-to-r from-purple-600 to-blue-600 text-white shadow-lg'
                : 'bg-gray-800 bg-opacity-50 text-gray-300 hover:bg-gray-700'
            }`}
          >
            <Icon className="w-4 h-4 mr-2" />
            {tab.label}
          </button>
        );
      })}
    </div>

    {/* Tab Content */}
    <div className="bg-gray-800 bg-opacity-30 rounded-lg p-8 backdrop-blur-sm border border-gray-600">
      {renderTabContent()}
    </div>

    {/* Changes Indicator */}
    {hasChanges && (
      <div className="fixed bottom-6 right-6 bg-yellow-600 text-white px-4 py-2 rounded-lg shadow-lg">
        Unsaved changes detected
      </div>
    )}
  </div>
</div>
```

);
};

export default AdvancedSettingsPanel;
import matplotlib.pyplot as plt

x = [3, 5, 7, 10, 12]
marca = [3, 11, 25, 55, 85]
runtime = [0, 0.000379, 0.015915, 11.2507, 42*60+5]

plt.plot(x, runtime)
plt.xlabel('Eje x')
plt.ylabel('Tiempo (s)')
plt.title('Gráfica de runtime')
plt.show()

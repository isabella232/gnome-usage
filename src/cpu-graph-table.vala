using Rg;

namespace Usage {

    public class CpuGraphTable : Rg.Table
    {
        public CpuGraphTable (uint timespan, uint max_samples)
        {
            set_timespan (timespan * 1000);
            set_max_samples (max_samples);

            var column = new Rg.Column("TOTAL CPU", Type.from_name("gdouble"));
            add_column(column);

            (GLib.Application.get_default() as Application).monitor.set_update_graph_interval(timespan / (max_samples - 1));
            Timeout.add(timespan / (max_samples - 1), update_data);
        }

        public CpuGraphTable.multi (uint timespan, uint max_samples)
        {
            set_timespan (timespan * 1000);
            set_max_samples (max_samples);

            for (int i = 0; i < get_num_processors(); i++)
            {
              var column = new Rg.Column("CPU: " + i.to_string(), Type.from_name("gdouble"));
              add_column(column);
            }

            (GLib.Application.get_default() as Application).monitor.set_update_graph_interval(timespan / (max_samples - 1));
            Timeout.add(timespan / (max_samples - 1), update_data_multi);
        }

        bool update_data()
        {
            Rg.TableIter iter;
            push (out iter, get_monotonic_time ());
            iter.set (0, (GLib.Application.get_default() as Application).monitor.cpu_load_graph, -1);

            return true;
        }

        bool update_data_multi()
        {
            Rg.TableIter iter;
            push (out iter, get_monotonic_time ());

            for (int i = 0; i < get_num_processors(); i++)
                iter.set (i, (GLib.Application.get_default() as Application).monitor.x_cpu_load_graph[i], -1);

            return true;
        }
    }
}

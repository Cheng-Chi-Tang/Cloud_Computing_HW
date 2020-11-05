import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class WordCount {

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "log count");
        job.setJarByClass(WordCount.class);
        job.setMapperClass(WordTimeMapper.class);
        job.setCombinerClass(CountSumReducer.class);
        job.setReducerClass(CountSumReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);
        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));
        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }

    public static class WordTimeMapper extends Mapper<Object, Text, Text, IntWritable> {
        private final static IntWritable one = new IntWritable(1);
        private Text word = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String input = value.toString();
            String[] lines = input.split("\\r?\\n");
            for(String str:lines) {
                String[] arr1 = str.split("\\[");
                String[] arr2 = arr1[1].split("\\]");
                String[] arr3 = arr2[0].split(" ");
                String datetimeStr = arr3[0];
                String[] datetime = datetimeStr.split(":");
                datetimeStr = datetime[0] + ":" + datetime[1] + ":00:00";
                word.set(datetimeStr);
                context.write(word, one);
            }
        }
    }

    public static class CountSumReducer extends Reducer<Text, IntWritable, Text, IntWritable> {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws IOException, InterruptedException {
            int sum = 0;
            for(IntWritable val:values) {
                sum += val.get();
            }
            result.set(sum);
            context.write(key, result);
        }
    }
}